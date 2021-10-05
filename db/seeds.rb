# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

state = FederatedState.create(name: 'Paraná', acronym: 'PR')
City.create(name: 'Pato Branco', federated_state_id: state.id)
City.create(name: 'Curitiba', federated_state_id: state.id)
City.create(name: 'Cascavel', federated_state_id: state.id)
City.create(name: 'Foz do Iguaçu', federated_state_id: state.id)
City.create(name: 'Guarapuava', federated_state_id: state.id)
state = FederatedState.create(name: 'Santa Catarina', acronym: 'SC')
City.create(name: 'Balneário Camboriú', federated_state_id: state.id)
City.create(name: 'Chapecó', federated_state_id: state.id)
City.create(name: 'Florianópolis', federated_state_id: state.id)
City.create(name: 'Joinville', federated_state_id: state.id)
City.create(name: 'Blumenau', federated_state_id: state.id)
state = FederatedState.create(name: 'Rio Grande do Sul', acronym: 'RS')
City.create(name: 'Porto Alegre', federated_state_id: state.id)
City.create(name: 'Santa Maria', federated_state_id: state.id)
City.create(name: 'Novo Hamburgo', federated_state_id: state.id)
City.create(name: 'Canoas', federated_state_id: state.id)
City.create(name: 'Passo Fundo', federated_state_id: state.id)
