<script>
  import {
    Header,
    HeaderNav,
    HeaderNavItem,
    HeaderUtilities,
    SideNav,
    SideNavItems,
    SideNavLink,
    SideNavDivider,
    SkipToContent,
    HeaderGlobalAction,
  } from "carbon-components-svelte";
  import { UserAvatarFilledAlt } from "carbon-icons-svelte";
  let isSideNavOpen = false;

  let open = false;
  // import logo from '../../static/image 18.png';
</script>

<Header
  expansionBreakpoint={1700}
  company="Coffee Track"
  platformName=""
  bind:isSideNavOpen
  href="/"
>
  <svelte:fragment slot="skip-to-content">
    <SkipToContent />
  </svelte:fragment>
  <HeaderNav>
    <HeaderNavItem href="/" text="About" />
    <HeaderNavItem href="/" text="Help" />
    <HeaderNavItem href="/" text="Start a project" />
  </HeaderNav>
  <HeaderUtilities>
    <HeaderGlobalAction
      on:click={() => (open = true)}
      iconDescription="Profile"
      icon={UserAvatarFilledAlt}
    />
  </HeaderUtilities>
</Header>

<SideNav bind:isOpen={isSideNavOpen}>
  <SideNavItems>
    <SideNavLink text="About" />
    <SideNavLink text="Help" />
    <SideNavLink text="Start a project" />
    <SideNavDivider />
  </SideNavItems>
</SideNav>

<style>
  /* button{
      text-align: center;
      position: ;
    } */
</style>
