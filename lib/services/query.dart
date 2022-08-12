const getAllCards = """
{
  cardTypes (where: { ipfsHash_not : null }) {
    id
    name
    description
    address
    supply
    symbol
    ipfsHash
  }
}
""";