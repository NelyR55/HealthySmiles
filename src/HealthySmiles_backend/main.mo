import HashMap "mo:base/HashMap";
import Text "mo:base/Text";
import Principal "mo:base/Principal";
import Array "mo:base/Array";
import Debug "mo:base/Debug";

actor HealthySmiles {
  public query func greet(name : Text) : async Text {
    return "Hola, " # name # "!";
  };

  type Paciente = Principal;

  // Definimos un tipo abstracto para los pacientes
  type PacienteInfo = {
    nombre: Text;
    sexo: Text;
    fecha_nacimiento: Text;
    historial: [Historial];
  };

  // Definimos un tipo abstracto para el historial de tratamientos
  type Historial = {
    fecha: Text;
    tratamiento: Text;
    notas: Text;
    proxima_cita: Text;
    firma_dentista: Principal;
  };

  // Creamos el hashmap para almacenar los pacientes y su historial
  let pacientes = HashMap.HashMap<Principal, PacienteInfo>(0, Principal.equal, Principal.hash);
  
  // Definimos la función para registrar la información de un paciente
  public shared (msg) func registrarPaciente(paciente : PacienteInfo) : async PacienteInfo {
    // Accedemos a la información del usuario o canister que llamó a la función
    let dueno : Principal = msg.caller;

    pacientes.put(dueno, paciente);

    Debug.print("La información de tu paciente ha sido almacenada correctamente " # Principal.toText(dueno) # " ¡gracias! :)");
    return paciente;
  };

  // Función que obtiene un paciente en caso de que exista en el HashMap
  public func getPaciente(account : Principal): async ?PacienteInfo {
    return pacientes.get(account);
  };

  // Definimos la función para registrar la información de un tratamiento a un paciente
  public shared (msg) func registrarHistorial(historial : Historial): async [Historial] {
    // Accedemos a la información del usuario o canister que llamó a la función
    let dueno : Principal = msg.caller;
    
    let paciente: ?PacienteInfo = await getPaciente(dueno);

    switch (paciente) {
        case (?paciente ) {
          var paciente_historial = paciente.historial;
          paciente_historial := Array.append<Historial>(paciente_historial, [historial]);
          return paciente_historial;
        };
        case (null) {};
    };

    Debug.print("Un nuevo historial ha sido registrado correctamente " # Principal.toText(dueno) # " ¡Hasta la próxima visita! :)");
    return [];
  };

  // Total de pacientes registrados
  public func getTotalPacientes() : async Int {
    // Se obtiene el número de elementos del HashMap como número de pacientes
    pacientes.size();
  };
};
