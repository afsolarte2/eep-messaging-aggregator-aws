exports.handler = async (event) => {
    const personId = 12225654

    const customers = [
        {
            id: 12225654,
            accountType: 'Savings',
            accountNumber: '5651665-5',
            bank: 'BBVA',
            country: 'Colombia'
        },
        {
            id: 133353254,
            accountType: 'Savings',
            accountNumber: '1111665-5',
            bank: 'Bancolombia',
            country: 'Colombia'
        },
        {
            id: 5634534,
            accountType: 'Savings',
            accountNumber: '33351665-5',
            bank: 'Banco de Bogota',
            country: 'Colombia'
        }
    ]

    return customers.find(person => person.id == personId)
}
