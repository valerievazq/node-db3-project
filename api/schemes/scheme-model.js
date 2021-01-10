// scheme-model
//database methods for modular coding

const db = require("../data/db-config");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  addStep,
  update,
  remove,
};
//promise that returns an array of schemes
function find() {
  return db("schemes");
}

//returns a single scheme by id
function findById(id) {
  return db("schemes").where({ id }).first();
}

function findSteps(id) {
  return db("schemes")
    .where("schemes.id", "=", id)
    .join("steps", "schemes.id", "=", "steps.scheme_id")
    .select(
      "steps.id",
      "steps.step_number",
      "schemes.scheme_name",
      "steps.instructions"
    );
}

async function add(data) {
  const [id] = await db("schemes").insert(data);
  const scheme = findById(id);
  return scheme;
}

async function addStep(stepData, scheme_id) {
  const [id] = await db("steps").insert({ ...stepData, scheme_id });
  const step = db("steps").where({ id }).first();
  return step;
}

function update(changes, id) {
  return db("schemes").where({ id }).update(changes, id);
}

function remove(id) {
  return db("schemes").where({ id }).del();
}
