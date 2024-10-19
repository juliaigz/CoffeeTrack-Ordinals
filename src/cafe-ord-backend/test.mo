import HashMap "mo:base/HashMap";

// Define el tipo StacksOrdinal y Metadata como previamente.
type Metadata = {
    title: ?Text;               // Título del activo (si es un NFT)
    description: ?Text;         // Descripción del activo
    imageUrl: ?Text;            // URL de la imagen asociada
    additionalData: ?Record<Text, Text>; // Datos adicionales
};

type StacksOrdinal = {
    ordinalNumber: Nat;         // El número ordinal (ej. 1, 2, 3, ...)
    satoshiId: Text;           // Identificador único del satoshi (hash)
    transactionHash: Text;      // Hash de la transacción donde fue creado
    blockNumber: Nat;           // Número del bloque donde se incluyó la transacción
    metadata: ?Metadata;        // Metadatos opcionales (por ejemplo, para NFTs)
};

// Crear un HashMap donde el key es un Text (satoshiId) y el value es un StacksOrdinal
let ordinals: HashMap<Text, StacksOrdinal> = HashMap<Text, StacksOrdinal>

public func addOrdinal(ordinal: StacksOrdinal) : Bool {
    // Intenta añadir el ordinal al HashMap
    switch (HashMap.insert(ordinals, ordinal.satoshiId, ordinal)) {
        case (#ok) { true };
        case (#err) { false };
    }
};

public func getOrdinal(satoshiId: Text) : ?StacksOrdinal {
    // Recupera un StacksOrdinal del HashMap usando el satoshiId
    switch (HashMap.get(ordinals, satoshiId)) {
        case (?ordinal) { ?ordinal };
        case null { null }; // Si no se encuentra, retorna null
    }
}

// Ejemplo de uso
public func exampleUsage() {
    let metadata: Metadata = {
        title = ? "Mi NFT",
        description = ? "Descripción del NFT",
        imageUrl = ? "http://example.com/image.png",
        additionalData = ? #{"key" = "value"}
    };

    let newOrdinal: StacksOrdinal = {
        ordinalNumber = 1,
        satoshiId = "satoshi_hash_1",
        transactionHash = "tx_hash_1",
        blockNumber = 123456,
        metadata = ? metadata
    };

    // Agregar el nuevo ordinal al HashMap
    let added = addOrdinal(newOrdinal);
    
    // Recuperar el ordinal usando el satoshiId
    let retrievedOrdinal = getOrdinal("satoshi_hash_1");
    
    // Aquí puedes hacer algo con el ordinal recuperado
    switch (retrievedOrdinal) {
        case (?ordinal) {
            // Procesa el ordinal encontrado
        };
        case null {
            // Manejar el caso en que no se encontró el ordinal
        };
    };
}
