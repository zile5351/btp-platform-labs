import cds from '@sap/cds'

const { GET, POST, expect, defaults } = cds.test (import.meta.dirname+'/..')
defaults.auth = { username: 'no_user_found_for_roles_authenticated-user', password: '' }

describe('CatalogService OData APIs', () => {

  it('serves CatalogService.ListOfBooks', async () => {
    const { data } = await GET `/odata/v4/catalog/ListOfBooks ${{ params: { $select: 'ID,author' } }}`
    expect(data.value).to.containSubset([
      // {"ID":22349228,"author":"author-22349228"},
    ])
  })

  it('executes submitOrder', async () => {
    const { data } = await POST `/odata/v4/catalog/submitOrder ${
      {}
      // {"book":3369699,"quantity":92}
    }`
    // TODO finish this test
    // expect(data.value).to...
  })
})
