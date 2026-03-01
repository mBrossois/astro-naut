# Svelte Cheatsheet

## Component Structure

```svelte
<script>
  // JS logic here
  let count = 0;
</script>

<!-- Template -->
<h1>{count}</h1>

<style>
  /* Scoped CSS */
  h1 { color: red; }
</style>
```

---

## Reactivity

```svelte
<script>
  let count = 0;

  // Reactive statement (re-runs when deps change)
  $: doubled = count * 2;

  // Reactive block
  $: {
    console.log('count changed:', count);
    console.log('doubled:', doubled);
  }

  // Reactive if
  $: if (count >= 10) alert('Too high!');
</script>
```

---

## Props

```svelte
<!-- Child.svelte -->
<script>
  export let name;
  export let age = 25; // default value
</script>
<p>{name} is {age}</p>

<!-- Parent.svelte -->
<Child name="Alice" age={30} />
<!-- Spread props -->
<Child {...obj} />
```

---

## Events

```svelte
<!-- Inline -->
<button on:click={() => count++}>Click</button>

<!-- Handler -->
<script>
  function handleClick(event) { count++; }
</script>
<button on:click={handleClick}>Click</button>

<!-- Event modifiers -->
<button on:click|preventDefault={fn}>Submit</button>
<button on:click|once={fn}>Once</button>
<button on:click|stopPropagation={fn}>Stop</button>

<!-- Custom events (dispatch from child) -->
<script>
  import { createEventDispatcher } from 'svelte';
  const dispatch = createEventDispatcher();
  dispatch('message', { text: 'Hello' });
</script>

<!-- Listen in parent -->
<Child on:message={handleMessage} />
```

---

## Bindings

```svelte
<!-- Two-way binding -->
<input bind:value={name} />
<input type="checkbox" bind:checked={yes} />
<input type="number" bind:value={num} />
<select bind:value={selected}>
  <option value="a">A</option>
</select>
<textarea bind:value={text} />

<!-- Element binding -->
<div bind:this={element} />

<!-- Component binding -->
<MyComponent bind:value={val} />
```

---

## Control Flow

```svelte
<!-- If / else if / else -->
{#if count > 10}
  <p>Big</p>
{:else if count > 5}
  <p>Medium</p>
{:else}
  <p>Small</p>
{/if}

<!-- Each -->
{#each items as item}
  <p>{item.name}</p>
{/each}

<!-- Each with index & key -->
{#each items as item, i (item.id)}
  <p>{i}: {item.name}</p>
{:else}
  <p>No items</p>
{/each}

<!-- Await -->
{#await promise}
  <p>Loading...</p>
{:then value}
  <p>Result: {value}</p>
{:catch error}
  <p>Error: {error.message}</p>
{/await}
```

---

## Stores

```svelte
<!-- stores.js -->
import { writable, readable, derived } from 'svelte/store';

export const count = writable(0);
export const time = readable(new Date(), (set) => {
  const interval = setInterval(() => set(new Date()), 1000);
  return () => clearInterval(interval); // cleanup
});
export const doubled = derived(count, $count => $count * 2);

<!-- Component.svelte -->
<script>
  import { count } from './stores.js';

  // Auto-subscribe with $ prefix (auto-unsubscribes)
  $count; // reactive value

  // Manual subscribe
  const unsub = count.subscribe(value => console.log(value));

  // Update
  count.set(5);
  count.update(n => n + 1);
</script>

<p>{$count}</p>
```

---

## Lifecycle

```svelte
<script>
  import { onMount, onDestroy, beforeUpdate, afterUpdate, tick } from 'svelte';

  onMount(() => {
    console.log('Mounted');
    return () => console.log('Cleanup'); // optional cleanup
  });

  onDestroy(() => console.log('Destroyed'));
  beforeUpdate(() => console.log('Before DOM update'));
  afterUpdate(() => console.log('After DOM update'));

  // Wait for DOM to update
  async function updateAndLog() {
    count++;
    await tick();
    // DOM is now updated
  }
</script>
```

---

## Slots

```svelte
<!-- Card.svelte -->
<div class="card">
  <slot name="header" />  <!-- Named slot -->
  <slot />                 <!-- Default slot -->
  <slot name="footer">Default footer</slot> <!-- Fallback -->
</div>

<!-- Parent -->
<Card>
  <h1 slot="header">Title</h1>
  <p>Body content</p>
  <p slot="footer">Footer</p>
</Card>
```

---

## Context

```svelte
<!-- Parent -->
<script>
  import { setContext } from 'svelte';
  setContext('key', { value: 42 });
</script>

<!-- Child (any depth) -->
<script>
  import { getContext } from 'svelte';
  const ctx = getContext('key');
</script>
```

---

## Transitions & Animations

```svelte
<script>
  import { fade, fly, slide, scale, draw } from 'svelte/transition';
  import { flip } from 'svelte/animate';
  import { tweened, spring } from 'svelte/motion';
</script>

{#if visible}
  <p transition:fade>Fades in and out</p>
  <p in:fly="{{ y: 200 }}" out:fade>Custom in/out</p>
{/if}

<!-- Animate list reordering -->
{#each list as item (item.id)}
  <div animate:flip>{item.name}</div>
{/each}

<!-- Motion stores -->
<script>
  const progress = tweened(0, { duration: 400 });
  const coords = spring({ x: 0, y: 0 });
  $progress = 1; // animates to 1
</script>
```

---

## Special Elements

```svelte
<!-- Dynamic component -->
<svelte:component this={CurrentComponent} prop={val} />

<!-- Window / body bindings -->
<svelte:window bind:innerWidth={w} on:keydown={handleKey} />
<svelte:body on:mouseenter={fn} />

<!-- Head injection -->
<svelte:head>
  <title>My Page</title>
</svelte:head>

<!-- Self-referencing recursion -->
<svelte:self depth={depth + 1} />

<!-- Options -->
<svelte:options immutable={true} />
```

---

## SvelteKit Essentials

```
src/
  routes/
    +page.svelte        → page component
    +page.js            → load function (universal)
    +page.server.js     → server-only load + actions
    +layout.svelte      → layout wrapper
    +layout.js          → layout load
    +error.svelte       → error page
    blog/[slug]/        → dynamic route
    (group)/            → route group (no URL segment)
    [...rest]/          → catch-all route
```

```js
// +page.server.js — Load & Actions
export async function load({ params, fetch, cookies, locals }) {
  const data = await fetch(`/api/${params.slug}`).then(r => r.json());
  return { data };
}

export const actions = {
  default: async ({ request, cookies }) => {
    const form = await request.formData();
    // handle form
    return { success: true };
  }
};
```

```svelte
<!-- +page.svelte -->
<script>
  export let data;   // from load()
  export let form;   // from action result
</script>
```

---

## Useful Snippets

```svelte
<!-- Class toggling -->
<div class:active={isActive} class:big={size > 10}>

<!-- Dynamic style -->
<p style:color={myColor} style:font-size="{size}px">

<!-- Spread attributes -->
<input {...$$restProps} />

<!-- Forward all events -->
<button on:click on:mouseover>Forward</button>
```