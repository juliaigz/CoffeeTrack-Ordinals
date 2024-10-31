// This is a generated Motoko binding for the coffee traceability project.

module Types {
  public type AccountIdentifier = { hash : [Nat8] };
  
  // Representa el ordinal de Bitcoin para la trazabilidad.
  public type StacksOrdinal = {
    ordinalNumber: ?Nat;         // El número ordinal (ej. 1, 2, 3, ...)
    satoshiId: Text;           // Identificador único del satoshi (hash)
    transactionHash: ?Text;      // Hash de la transacción donde fue creado
    blockNumber: ?Nat;           // Número del bloque donde se incluyó la transacción
    metadata: ?Metadata;        // Metadatos opcionales (por ejemplo, para NFTs)
  };

  public type Metadata = {
    title: ?Text;               // Título del activo (si es un NFT)
    description: ?Text;         // Descripción del activo
    // imageUrl: ?Text;            // URL de la imagen asociada
    // additionalData: ?Record<Text, Text>; // Datos adicionales
  };

 public type CultivationData = {
  producerName: Text;         // Nombre del productor.
  harvestMethod: Text;        // Método de cosecha.
  harvestDate: Nat64;         // Fecha de la cosecha (puede ser timestamp).
  postHarvestTreatment: Text; // Tratamiento post cosecha.
  coffeeOrigin: Text;         // Provenencia del café.
  stacksOrdinal: StacksOrdinal; // Referencia al ordinal de Bitcoin.
};


  public type CoffeeTraceability = {
    id : Nat;                     // Identificador único de la trazabilidad.
    cultivation : CultivationData; // Datos de cultivo asociados.
    processing : Text;             // Información sobre el procesamiento.
    transportation : Text;         // Información sobre el transporte.
    exportDate : Nat64;           // Fecha de exportación.
    recipient : Principal;         // Destinatario de la exportación.
  };

  public type Error = {
    #NotFound;
    #Unauthorized;
    #InvalidData : Text;
  };

  public type Result = {
    #ok : CoffeeTraceability;
    #err : Error;
  };
  
  
  
    //1. Type that describes the Request arguments for an HTTPS outcall
    //See: https://internetcomputer.org/docs/current/references/ic-interface-spec/#ic-http_request
    public type HttpRequestArgs = {
        url : Text;
        max_response_bytes : ?Nat64;
        headers : [HttpHeader];
        body : ?[Nat8];
        method : HttpMethod;
        transform : ?TransformRawResponseFunction;
    };

    public type HttpHeader = {
        name : Text;
        value : Text;
    };

    public type HttpMethod = {
        #get;
        #post;
        #head;
    };

    public type HttpResponsePayload = {
        status : Nat;
        headers : [HttpHeader];
        body : [Nat8];
    };

    //2. HTTPS outcalls have an optional "transform" key. These two types help describe it.
    //"The transform function may, for example, transform the body in any way, add or remove headers, 
    //modify headers, etc. "
    //See: https://internetcomputer.org/docs/current/references/ic-interface-spec/#ic-http_request
    
    //2.1 This type describes a function called "TransformRawResponse" used in line 14 above
    //"If provided, the calling canister itself must export this function." 
    //In this minimal example for a GET request, we declare the type for completeness, but 
    //we do not use this function. We will pass "null" to the HTTP request.
    public type TransformRawResponseFunction = {
        function : shared query TransformArgs -> async HttpResponsePayload;
        context : Blob;
    };

    //2.2 This type describes the arguments the transform function needs
    public type TransformArgs = {
        response : HttpResponsePayload;
        context : Blob;
    };

    public type CanisterHttpResponsePayload = {
        status : Nat;
        headers : [HttpHeader];
        body : [Nat8];
    };

    public type TransformContext = {
        function : shared query TransformArgs -> async HttpResponsePayload;
        context : Blob;
    };


    //3. Declaring the IC management canister which we use to make the HTTPS outcall
    public type IC = actor {
        http_request : HttpRequestArgs -> async HttpResponsePayload;
    };

}
