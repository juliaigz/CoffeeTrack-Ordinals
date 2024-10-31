import HashMap "mo:base/HashMap";
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Debug "mo:base/Debug";
import Blob "mo:base/Blob";
import Cycles "mo:base/ExperimentalCycles";
import Error "mo:base/Error";
import Array "mo:base/Array";
import Nat8 "mo:base/Nat8";
import Nat64 "mo:base/Nat64";

//import the custom types we have in Types.mo
import Types "Types";


actor {
type OrdinalNumber = Text;
type CultivationData = {
  producerName: Text;         // Nombre del productor.
  harvestMethod: Text;        // Método de cosecha.
  harvestDate: Text;         // Fecha de la cosecha (puede ser timestamp).
  postHarvestTreatment: Text; // Tratamiento post cosecha.
  coffeeOrigin: Text;         // Provenencia del café.
};

  let cultivationStorage = HashMap.HashMap<OrdinalNumber, CultivationData>(0, Text.equal, Text.hash);

  // Función para obtener todos los cultivos
  public query func showCultivations() : async [(OrdinalNumber, CultivationData)] {
    let cultivationIter = cultivationStorage.entries();
    return Iter.toArray(cultivationIter);
  };

  // Función para obtener un cultivo por su OrdinalNumber
  public query func showCultivationById(ordinalNumber : OrdinalNumber) : async ?CultivationData {
    return cultivationStorage.get(ordinalNumber);
  };

  // Función para agregar un nuevo cultivo
  public shared func addCultivation(ordinalNumber : OrdinalNumber, cultivationData : CultivationData) : async () {
  let existingCultivation = cultivationStorage.get(ordinalNumber);
  let res = await generate_ordinal_with_unisat();
  if (existingCultivation == null) {
    Debug.print(debug_show (res));
    cultivationStorage.put(ordinalNumber, cultivationData);
    // return ?res;
  };
};

  // Función para actualizar un cultivo existente por su OrdinalNumber
  public func updateCultivationById(ordinalNumber : OrdinalNumber, cultivationData : CultivationData) : async ?CultivationData {
    let existingCultivation = cultivationStorage.get(ordinalNumber);
    if (existingCultivation != null) {
      cultivationStorage.put(ordinalNumber, cultivationData);
      return cultivationStorage.get(ordinalNumber);
    } else {
      return null;
    };
  };

  // Función para eliminar un cultivo por su OrdinalNumber
  public func removeCultivationById(ordinalNumber : OrdinalNumber) : async ?CultivationData {
    return cultivationStorage.remove(ordinalNumber);
  };

  public shared (msg) func whoami() : async Principal {
    msg.caller;
  };

  //function to transform the response
  public query func transform(raw : Types.TransformArgs) : async Types.CanisterHttpResponsePayload {
      let transformed : Types.CanisterHttpResponsePayload = {
          status = raw.response.status;
          body = raw.response.body;
          headers = [
              {
                  name = "Content-Security-Policy";
                  value = "default-src 'self'";
              },
              { 
                name = "Referrer-Policy"; 
                value = "strict-origin" 
              },
              { 
                name = "Permissions-Policy"; 
                value = "geolocation=(self)" },
              {
                  name = "Strict-Transport-Security";
                  value = "max-age=63072000";
              },
              { 
                name = "X-Frame-Options"; 
                value = "DENY" 
              },
              { 
                name = "X-Content-Type-Options"; 
                value = "nosniff" 
              },
          ];
      };
      transformed;
  };

//PULIC METHOD
//This method sends a POST request to a URL with a free API we can test.
  public func generate_ordinal_with_unisat() : async Text {

  
    let ic : Types.IC = actor ("aaaaa-aa");

    let url = "https://open-api-testnet.unisat.io/v2/inscribe/order/create"; //HTTP that accepts IPV6

  
    let request_headers = [
     
        { name= "Content-Type"; value = "application/json" },
    ];

   let request_body_json: Text = "{ \"receiveAddress\": \"2NFPjL28VbQRKBPjToNDyz4DD96f8vDFscy\", \"feeRate\": 1, \"outputValue\": 546, \"files\": [ { \"name\": \"archivo.txt\", \"type\": \"text/plain\", \"content\": \"Contenido del archivo en formato base64\" } ], \"devAddress\": \"2NFPjL28VbQRKBPjToNDyz4DD96f8vDFscy\", \"devFee\": 1000 }";
    let request_body_as_Blob: Blob = Text.encodeUtf8(request_body_json); 
    let request_body_as_nat8: [Nat8] = Blob.toArray(request_body_as_Blob); // e.g [34, 34,12, 0]

    let transform_context : Types.TransformContext = {
      function = transform;
      context = Blob.fromArray([]);
    };

   
    let http_request : Types.HttpRequestArgs = {
        url = url;
        max_response_bytes = null;
        headers = request_headers;

        body = ?request_body_as_nat8; 
        method = #post;
        transform = ?transform_context;
    };

    Cycles.add(230_850_258_000);
    
     let http_response : Types.HttpResponsePayload = await ic.http_request(http_request);
    
   let response_body: Blob = Blob.fromArray(http_response.body);
    let decoded_text: Text = switch (Text.decodeUtf8(response_body)) {
        case (null) { "No value returned" };
        case (?y) { y };
    };

    let result: Text = decoded_text # ". See more info of the request sent at: " # url # "/inspect";
    result
  };
};
