<script>
  import { Accordion, AccordionItem } from "carbon-components-svelte";
  import logoCaffe from "../lib/images/Coffe.png";
  import { Content, Grid, Row, Column } from "carbon-components-svelte";
  import { ProgressIndicator, ProgressStep } from "carbon-components-svelte";
  import { backend } from "$lib/canisters.js";
  import { TextInput, TextArea, Button } from "carbon-components-svelte";
  import { DatePicker, DatePickerInput } from "carbon-components-svelte";
  import {
    Form,
    FormGroup,
    RadioButtonGroup,
    RadioButton,
    Select,
    SelectItem,
  } from "carbon-components-svelte";
  import { GroupObjects } from "carbon-icons-svelte";

  function generateOrdinal() {
    // Simulate a block height (e.g., 100,000 to 800,000 blocks)
    const blockHeight =
      Math.floor(Math.random() * (800000 - 100000 + 1)) + 100000;

    // Simulate an index within the block (e.g., 0 to 10,000 transactions in a block)
    const index = Math.floor(Math.random() * 10000);

    return `${blockHeight}:${index}`;
  }

  import { goto } from "$app/navigation"; // Asegúrate de importar 'goto' desde SvelteKit

  const handleSubmit = async (event) => {
    event.preventDefault();

    const formData = {
      producerName,
      harvestMethod,
      harvestDate,
      postHarvestTreatment,
      coffeeOrigin,
    };

    // Llamada al backend para agregar la información de la cosecha
    await backend.addCultivation(generateOrdinal(), formData).then((res) => {
      console.log(res);
    });

    // Llamada al backend para mostrar las cosechas
    await backend.showCultivations().then((res) => {
      console.log(res);
    });

    // Redirección a la ruta /ordinal usando SvelteKit's goto
    goto("/ordinals");
  };
  //

  // function onSubmit(event) {
  //   const name = event.target.name.value;
  // backend.greet(name).then((response) => {
  //     greeting = response;
  //   });
  //   return false;
  // }

  let producerName = "Luz Maria";
  let harvestMethod = "Organico";
  let harvestDate = "11/04/2024";
  let postHarvestTreatment = "Fermentado";
  let coffeeOrigin = "Parcela 002 de Finca Luz";
</script>

<Grid>
  <Row>
    <Column lg={7}>
      <div class="infoText">
        <h1>Trazabilidad de cosecha</h1>
        <p>Formulario llenado por el productor</p>
      </div>

      <figure>
        <img src={logoCaffe} alt="Coffe logo company" />
      </figure>
    </Column>

    <!-- Form column -->
    <Column
      style="box-shadow: -1px -3px 5px 6px rgba(173, 173, 173, 0.99) inset;
      display: flex;
      flex-direction: column;
      border-radius: 5%;
      padding: 5%;
      width: 100%;
      height: 140vh;"
    >
      <Form on:submit={handleSubmit}>
        <div class="setName">
          <TextInput
            bind:value={producerName}
            labelText="Nombre del productor"
            placeholder="Nombre"
            required
          />
        </div>

        <FormGroup
          class="RadioButton"
          style="margin-top: 2em; display: flex; flex-direction: column;"
          legendText="¿Que método de cosecha utilizaste?"
        >
          <p>Metodo de cultivo</p>
          <RadioButtonGroup
            name="radio-button-group"
            bind:value={harvestMethod}
            style="margin-top: 1.43em;"
            required
          >
            <RadioButton id="radio-1" value="Organico" labelText="Orgánico" />
            <RadioButton
              id="radio-2"
              value="Convencional"
              labelText="Convencional"
    
            />
          </RadioButtonGroup>
        </FormGroup>

        <FormGroup>
          <DatePicker bind:value={harvestDate} datePickerType="single" required>
            <DatePickerInput
              labelText="¿En que fecha se cosechará el café?"
              placeholder="mm/dd/yyyy"
            />
          </DatePicker>
        </FormGroup>

        <FormGroup required>
          <Select
            id="select-1"
            bind:value={postHarvestTreatment}
            labelText="¿Que tratamiento post-cosecha utilizaste?"
        
          >
            <SelectItem
              disabled
              hidden
              value="placeholder-item"
              text="Elije una opción"
              required
            />
            <SelectItem value="Lavado" text="Lavado" />
            <SelectItem value="Secado" text="Secado" />
            <SelectItem value="Fermentado" text="Fermentado" />
          </Select>
        </FormGroup>

        <FormGroup>
          <TextArea
            bind:value={coffeeOrigin}
            labelText="¿De qué parcela o sección de la finca proviene este lote de café?"
            placeholder="Enter a description..."
            maxCount={100}
          />
        </FormGroup>

        <Button type="submit">Submit</Button>
      </Form>

      <Button
        style="position: relative; left: 25%; padding-left: 10em; margin-top: 1%;"
        kind="ghost"
        href="/ordinals"
      >
        Go data page
      </Button>
    </Column>
  </Row>
</Grid>

<style>
  .infoText {
    margin-top: 10%;
  }

  .infoText h1 {
    font-weight: bold;
  }

  figure {
    width: 100%;
    height: 4em;
    margin-top: 5em;
  }
</style>
