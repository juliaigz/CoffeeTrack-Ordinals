<script>
  import { DataTable } from "carbon-components-svelte";
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
    { key: "parcela", value: "Parcela" }

  ]}
  rows={[
    {
      id: "a",
      ordinal: "cac8fe71f739144cc22d2a5b81ce39f4aa646d03d1c85219c73321b7fcb9562di0",
      productor: "Juan Perez",
      metodo_cultivo: "Convencional",
      fecha_cosecha: "12/01/24",
      tratamiento: "Secado",
      parcela: "Parcela 023"
    },
    {
      id: "b",
      ordinal: "ba62ee2ded652567d36c924fcce55f0d225994671929769f3a504d702ae08f69i0",
      productor: "Raul Sanchez",
      metodo_cultivo: "Orgánico",
      fecha_cosecha: "11/11/24",
      tratamiento: "Lavado ",
      parcela: "Espacio 002 - Finca Luz"
    },
    {
      id: "c",
      ordinal: "48e36e63a1f711b39cbd9b17b0c662780ed26db009e8b78a337681534bb31d7ai0",
      productor: "Luis  Ricra",
      metodo_cultivo: "Convencional",
      fecha_cosecha: "01/12/24",
      tratamiento: "Lavado, Secado, Fermentado",
      parcela: "Parcela 123"
    },
    {
      id: "d",
      ordinal: "b62a14d8db64ef44e57013122afa0fb3582e9a9a6fbc37c2ff3861ec9522420di0",
      productor: "Manuel  Gomez",
      metodo_cultivo: "Orgánico",
      fecha_cosecha: "10/58/25",
      tratamiento: "Lavado, Secado",
      parcela: "Parcela 2 "
    },
  ]}
/>


</main>

 
<style>
main{
  width: 100%;

}








</style>