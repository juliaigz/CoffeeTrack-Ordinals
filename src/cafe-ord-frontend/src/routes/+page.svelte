<script>
  import { Accordion, AccordionItem } from "carbon-components-svelte";
  import logoCaffe from "../lib/images/Coffe.png";
  import { Content, Grid, Row, Column } from "carbon-components-svelte";
  import { ProgressIndicator, ProgressStep } from "carbon-components-svelte";
  import {
    TextInput,
    MultiSelect,
    TextArea,
    FileUploader,
    Button,
  } from "carbon-components-svelte";
  import { DatePicker, DatePickerInput } from "carbon-components-svelte";
  import {
    Form,
    FormGroup,
    RadioButtonGroup,
    RadioButton,
    Select,
    SelectItem,
  } from "carbon-components-svelte";

  let greeting = "";
  let open = false;
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
      <Form on:submit>
        <div class="setName">
          <TextInput labelText="Nombre del productor" placeholder="Nombre" />
        </div>

        <FormGroup
          class="RadioButton"
          style="margin-top: 2em; display: flex; flex-direction: column;"
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
              value="default-selected"
              labelText="Convencional"
            />
          </RadioButtonGroup>
        </FormGroup>

        <FormGroup>
          <DatePicker datePickerType="single">
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
