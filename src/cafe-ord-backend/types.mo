// This is a generated Motoko binding for the coffee traceability project.

module {
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
  
  // Puedes agregar más tipos según sea necesario.
}
