<script>
  import { DataTable } from "carbon-components-svelte";
  import { onMount } from "svelte";
  import { backend } from "$lib/canisters.js";

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
    ]}
    rows={canisterData}
  />
</main>

<style>
  main {
    width: 100%;
  }
</style>
