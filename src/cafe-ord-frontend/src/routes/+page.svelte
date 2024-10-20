<script>
  // import "../index.scss";
  import { Accordion, AccordionItem } from "carbon-components-svelte";
  // import { backend } from "$lib/canisters";

  let greeting = "";

  // function onSubmit(event) {
  //   const name = event.target.name.value;
  //   backend.greet(name).then((response) => {
  //     greeting = response;
  //   });
  //   return false;
  // }

  let open = false;


  import logoCaffe from '../lib/images/Coffe.png';


  import { Content } from "carbon-components-svelte";
  import { Grid, Row, Column } from "carbon-components-svelte";
  import { ProgressIndicator, ProgressStep } from "carbon-components-svelte";
  import { TextInput } from "carbon-components-svelte";
  import { MultiSelect } from "carbon-components-svelte";
  import { TextArea } from "carbon-components-svelte";
  import { FileUploader } from "carbon-components-svelte";
  import { Button } from "carbon-components-svelte";
  import { DatePicker, DatePickerInput } from "carbon-components-svelte";

  import {
    Form,
    FormGroup,
    Checkbox,
    RadioButtonGroup,
    RadioButton,
    Select,
    SelectItem,
  } from "carbon-components-svelte";
</script>

<!-- 
<main>
  <img src="/logo2.svg" alt="DFINITY logo" />
  <br />
  <br />
  <form action="#" on:submit|preventDefault={onSubmit}>
    <label for="name">Enter your name: &nbsp;</label>
    <input id="name" alt="Name" type="text" />
    <button type="submit">Click Me!</button>
  </form>
  <section id="greeting">{greeting}</section>
</main> -->

<Content>
  <Grid>
    <Row>
      <Column lg={7}>
        <div class="infoText">
          <h1>Trazabilidad de cosecha</h1>
          <p>Formulario llenado por el productor</p>
        </div>



        <figure>
          <img src={logoCaffe} alt="Coffe logo company">
        </figure>

      </Column>

      <!-- Form column -->
      <Column
        style="	box-shadow: -1px -3px 5px 6px rgba(173, 173, 173, 0.99) inset;
      display: flex;
      flex-direction: column;
      border-radius: 5%;
      padding: 5%;
      width: 100%;
      height: 140vh;"
      >
        <Form on:submit>
          <div class="setName">
            <TextInput labelText="Nombre del productor" placeholder="Nombre" />
          </div>

          <FormGroup
            class="RadioButton"
            style="margin-top: 2em; display: flex; flex-direction: column; "
            legendText="¿Que método de cosecha utilizaste?"
          >
            <p>Metodo de cultivo</p>
            <RadioButtonGroup
              name="radio-button-group"
              selected="default-selected"
              style="margin-top: 1.43em;"
            >
              <RadioButton id="radio-1" value="standard" labelText="Orgánico" />
              <RadioButton
                id="radio-2"
                s
                value="default-selected"
                labelText="Convencional"
              />
            </RadioButtonGroup>
          </FormGroup>

          <FormGroup>
            <DatePicker datePickerType="single" on:change>
              <DatePickerInput
                labelText="¿En que fecha se cosechará el café?"
                placeholder="mm/dd/yyyy"
              />
            </DatePicker>
          </FormGroup>

          <FormGroup>
            <Select
              id="select-1"
              labelText="¿Que tratamiento post-cosecha utilizaste?"
            >
              <SelectItem
                disabled
                hidden
                value="placeholder-item"
                text="Elije una opción"
              />
              <SelectItem value="option-1" text="Lavado" />
              <SelectItem value="option-2" text="Secado" />
              <SelectItem value="option-3" text="Fermentado" />
            </Select>
          </FormGroup>

          <FormGroup>
            <TextArea
              labelText="De que parcela o sección de la finca proviene este lote de café?"
              placeholder="Enter a description..."
              maxCount={100}
            />
          </FormGroup>

          <Button type="submit">Submit</Button>
        </Form>

        <Button
          class="buttonNext"
          style="position: relative; left: 25%; padding-left: 10em;   margin-top: 6%;"
          kind="secondary"
          href="/ordinals"
        >
          Next
        </Button>

        <Button
          style="position: relative; left: 25%; padding-left: 10em;   margin-top: 1%;"
          kind="ghost"
          href="/">Back</Button
        >
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

    /* .setName { */
    /* border: 1px solid black; */
    /* box-shadow: -1px -3px 5px 6px rgba(173, 173, 173, 0.99) inset;
      display: flex;
      flex-direction: column;
      border-radius: 5%;
      padding: 10%;
      width: 100%;
      height: 120vh; */
    /* } */



    figure{
      with:100%;
      heigth: 4em;
      margin-top: 5em;
    }

  </style>
</Content>
