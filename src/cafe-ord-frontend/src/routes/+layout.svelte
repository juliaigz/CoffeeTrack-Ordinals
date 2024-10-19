<script>
  import Navbar from "$lib/Navbar.svelte";
  import { Content } from "carbon-components-svelte";
  import "carbon-components-svelte/css/all.css";
</script>

<Navbar />

<Content>
  <slot />
</Content>

<style>
  /* your styles go here */
</style>
