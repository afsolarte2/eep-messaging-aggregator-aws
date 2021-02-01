exports.handler = async (event) => {
    const personId = 12225654

    const customers = [
        {
            id: 12225654,
            country: 'Colombia',
            state: 'Cundinamarca',
            city: 'Bogotá',
            address: 'Cll 45 # 22 10'
        },
        {
            id: 133353254,
            country: 'Colombia',
            state: 'Antioquia',
            city: 'Medellín',
            address: 'Cra 12 # 11 Mz1 Casa08'
        },
        {
            id: 5634534,
            country: 'Colombia',
            state: 'Cundinamarca',
            city: 'Chía',
            address: 'Carrera 12 # 10 32'
        }
    ]

    return customers.find(person => person.id == personId)
}
