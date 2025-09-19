
$state = cria um estado mutável que pode ser alterado como uma variável comum.

$derived = permite "derivar" um estado de outro e, quando o original mudar, o derivado muda junto.

$inspect = permite inspecionar mudanças de estado (é um console.log). é removido da build final.

> É possível ter um estado global usando $state em um arquivo .svelte.ts


$effect aplica efeitos colateiras. geralmente não precisa ser usado.

$props permite passar props para filhos, desestruturando-as. props podem valor default.

```svelte
{#if count > 10}
	<p> Maior que 10</p>
{:else if count < 5}
	<p> Entre 0 e 5 </p>
{:else}
	<p> Entre 5 e 10</p>
{/if}
```


```svelte
{#each colors as color, i}
	<p> Color {i} = {color} </p>
{/each}
```

```svelte
{#await promise}
	<p>Aguardando...
{:then data}
	<p>{data.name}</p>
{:catch error}
	<p> Erro: {error} </p>
{/await}
```

```svelte
<script>
	let count = $state(0);

	function onclick() {
		count++;
	}
</script>

<button {onclick}> {count} </button>
<button onclick={onclick}> {count} </button>
```

```svelte
<script>
	let name = $state("");
	let value = $state(5);
	let check = $state(false);
</script>

<input bind:value={name}/>
<h1>{name}</h1>

<input type="number" bind:value={value} min="0" max="10" />
<input type="range" bind:value={value} min="0" max="10" />

<input type="checkbox" bind:checked={check}/>
```

