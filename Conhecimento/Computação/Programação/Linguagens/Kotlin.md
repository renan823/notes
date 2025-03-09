
### Jetpack Compose
Responsável pela criação da UI, substituindo o clássico XML.
A UI descritiva, ou seja, explicita em código, é muito similar ao React, por exemplo.

Cada parte da interface será criada usando funções combináveis (aka componentes) do compose, permitindo reutilização e simplicidade.

-> Funções combináveis comumente recebem o parâmetro `modifier: Modifier`, que representa o modificar, passado entre vários componentes. 

```kotlin
@Composable
fun MyComponent(name: String) {
	Text(text = "Hello, {name}")
}
```

Cada função combinável pode receber parâmetros, atualizando a interface quando detectar mudanças, a chamada recomposição. Nada será retornado desse componente!

Para criar funções corretas, existe uma regra de nomenclatura:
- SEMPRE em Pascal Case
- APENAS nomes envolvendo substantivos
- NUNCA usar nomes com verbos, advérbios, ações, etc
- PODE incluir um adjetivo ao substantivo

`@Preview` permite visualizar partes da interface em uma aba de design do android studio.

`@Column` define uma coluna que pode receber quantos items forem necessários. Sua orientação vertical não garante scroll. 
É possível usar o `modifier` para aplicar padding, margin e align aos items da coluna.
É possível alinhar os items usando `verticalArrangement`.

```kotlin
@Composable
fun Card(name: String, modifier: Modifier = Modifier) {
	Column(
		modifier = modifier.padding(10.dp),
		verticalArrangement = Arrangement.Center
	) {
		Text(text = "Hi")
		Text(text = "How are you, $name?")
	}
}
```

#### Imagens
Tools -> Resource Manager

Resource Manager é responsável por gerenciar alguns recursos do app, dentre eles as imagens.

Insira uma nova imagem, escolhendo o modo `density` e aplicando `no-density` (ajusta para diferentes telas).
A imagem será salva em `res/drawable`.

`@Image` é a função combinável para criar uma imagem.
É necessário especificar qual imagem será renderizada, e para isso usamos o `paintResource`. O caminho até a imagem usa a classe `R` (gerada pelo android) para acessar os recursos do app. 

O `paintResource` retorna um `painter`, que será colocado no `@Image`. Também é necessário especificar a descrição no `contentDescription`, mas ela pode ser null.

```kotlin
@Composable
fun ImageCard(name: string, from: String, modifier: Modifier = Modifier) {
	val image = paintResource(R.drawable.myimage)
	Box(modifier) {
		Image(
			painter = image,
			contentDescription = null,
			contentScale = ContentScale.Crop
		)
		Card(
			name = name,
			from = from,
			modifier = Modifier
				.padding(10.dp)
				.fillMaxSize()
		)
	}
	
}
```

Para ajustar o tamanho da imagem e sua disposição na tela, usamos `contentScale`.