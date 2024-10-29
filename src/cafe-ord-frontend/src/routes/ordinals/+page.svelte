<script>
  import { DataTable, Link} from "carbon-components-svelte";
  import Launch from "carbon-icons-svelte/lib/Launch.svelte";
  import { onMount } from "svelte";
  import { backend } from "$lib/canisters.js";
  import { TextInput } from "carbon-components-svelte";


  import { Button, Modal } from "carbon-components-svelte";
  let open = false;

  import IconoCafe from '$lib/images/cafeIcono.png';




  let canisterData = [];

  function formatCoffeeData(data) {
    return data.map((item, index) => {
      const [ordinal, details] = item;
      return {
        id: String.fromCharCode(97 + index), // Genera un id a, b, c, ...
        ordinal: ordinal,
        productor: details.producerName || "Desconocido",
        metodo_cultivo: details.harvestMethod || "Desconocido",
        fecha_cosecha: details.harvestDate || "Desconocida",
        tratamiento: details.postHarvestTreatment || "Desconocido",
        parcela: details.coffeeOrigin || "Desconocida",
      };
    });
  }

  onMount(async () => {
    // Llamada al backend para mostrar las cosechas
    await backend.showCultivations().then((res) => {
      console.log(res);
      canisterData = formatCoffeeData(res);
    });
  });
</script>

<main>
  <h1>Ordinals Inscriptions</h1>

  <DataTable
    title="Ordinals Inscriptions"
    description="Data table description"
    headers={[
      { key: "ordinal", value: "Ordinal" },
      { key: "productor", value: "Productor" },
      { key: "metodo_cultivo", value: "Método Cultivo" },
      { key: "fecha_cosecha", value: "Fecha Cosecha" },
      { key: "tratamiento", value: "Tratamiento(s)" },
      { key: "parcela", value: "Parcela" },
      {key: "verMas", value:"Más Detalles"}
    ]}
    rows={canisterData}

   
  >
      <!-- <svelte:fragment slot="cell-header" let:header>
        {#if header.key === "productor"}
          {header.value}
        {:else}
          {header.value}
        {/if}
      </svelte:fragment> -->
      <svelte:fragment slot="cell" let:row let:cell>
        {#if cell.key === "verMas"}
          <Button class="Button" on:click={() => (open = true)}>Ver más información</Button>
        {:else}
          {cell.value}
        {/if}
      </svelte:fragment>
  </DataTable>
  <Modal bind:open passiveModal modalHeading="Ordinals Inscription" hasScrollingContent>
    <div class="boxImage">
      <img src={IconoCafe} alt="Icono de Café">
    </div>
    <p>{"480153:7968"}</p>
    <br />
    
    <div class="TextInput">
      <TextInput disabled labelText="Productor" placeholder="Juan perez" />
    </div>
    <div class="TextInput">
      <TextInput disabled labelText="Método de Cultivo" placeholder="Organico" />
    </div>
    <div class="TextInput">
      <TextInput disabled labelText="Fecha Cosecha" placeholder="Organico" />

    </div>
    <div class="TextInput">
      <TextInput disabled labelText="Tratamiento" placeholder="Organico" />

    </div>
    <div class="TextInput">
      <TextInput disabled labelText="Parcela" placeholder="Organico" />
    </div>


  </Modal>
</main>

<style>
  main {
    width: 100%;
  }

  .boxImage{
    width: 100%;
  }

  .boxImage img{
    position: relative;
    left: 40%;
  }
  :global(.TextInput){
    margin-top:1rem;
  }

  :global(.Button){
    background-color:#864d25;
    border-radius: 0.5em;
  }

  :global(.Button):hover{
    background-color:#75401a;
  }

</style>
