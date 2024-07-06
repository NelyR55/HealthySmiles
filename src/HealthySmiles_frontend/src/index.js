import { HealthySmiles_backend } from "../../declarations/HealthySmiles_backend";

document.querySelector("form").addEventListener("submit", async (e) => {
  e.preventDefault();

  const nombre = document.getElementById("nombre").value.toString();
  const sexo = document.getElementById("sexo").value.toString();
  const fecha_nacimiento = document.getElementById("fecha_nacimiento").value.toString();

  const paciente = {
    nombre,
    sexo,
    fecha_nacimiento,
    historial: []
  }

  // Interactuar con el actor HealthySmiles_backend, llamando al método registrarPaciente
  const pacienteRegistrado = await HealthySmiles_backend.registrarPaciente(paciente);
  alert(`${pacienteRegistrado.nombre} ha sido registrado exitosamente!! `);

});
