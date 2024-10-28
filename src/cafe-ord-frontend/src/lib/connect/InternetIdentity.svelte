<script lang="ts">
  import { AuthClient } from "@dfinity/auth-client";
  import { onMount } from "svelte";
  import { Principal } from "@dfinity/principal";
  import { auth, createActor } from "../store/auth";
  import { Button } from "carbon-components-svelte";
  import { Logout } from "carbon-icons-svelte";

  let client: AuthClient | undefined;
  let whoami: Promise<Principal> = $auth.actor.whoami(); // whoami es una promesa que resuelve en una string (principal)
  let principalId = "";
  onMount(async () => {
    client = await AuthClient.create();
    if (await client.isAuthenticated()) {
      handleAuth();
    }
  });

  function handleAuth() {
    if (!client) return; // Verificamos que client no sea undefined
    auth.update(() => ({
      loggedIn: true,
      actor: createActor({
        agentOptions: {
          identity: client!.getIdentity(),
        },
      }),
    }));
    whoami = $auth.actor.whoami();
    whoami.then((principal) => {
      principalId = principal.toText();
    });
  }

  function login() {
    if (!client) return; // Verificamos que client no sea undefined
    client.login({
      identityProvider:
        process.env.DFX_NETWORK === "ic"
          ? "https://identity.ic0.app/#authorize"
          : `http://${process.env.CANISTER_ID_INTERNET_IDENTITY}.localhost:4943/#authorize`,
      onSuccess: handleAuth,
    });
  }

  async function logout() {
    if (!client) return; // Verificamos que client no sea undefined
    await client.logout();
    auth.update(() => ({
      loggedIn: false,
      actor: createActor(),
    }));

    whoami = $auth.actor.whoami();
  }
</script>

<!-- <div class="container"> -->
{#if $auth.loggedIn}
  <div>
    <Button
      on:click={logout}
      icon={Logout}
      iconDescription={`${principalId}`}
    />
  </div>
{:else}
  <Button on:click={login}>Internet Identity</Button>
{/if}

<!-- <div class="principal-info">
    principal information:
    {#await whoami}
      Querying caller identity...
    {:then principal}
      Your principal ID is
      <code>{principal}</code>
      {#if principal.isAnonymous()}
        (anonymous)
      {/if}
    {/await}
  </div> -->
<!-- </div> -->
