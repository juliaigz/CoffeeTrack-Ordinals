import HashMap "mo:base/HashMap";
import Text "mo:base/Text";
import Iter "mo:base/Iter";


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
    if (existingCultivation == null) {
      cultivationStorage.put(ordinalNumber, cultivationData);
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
};
