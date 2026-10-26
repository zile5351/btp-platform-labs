import cds from '@sap/cds'

const { GET, POST, expect, defaults } = cds.test (import.meta.dirname+'/..')
defaults.auth = { username: 'no_user_found_for_roles_admin', password: '' }

describe('AdminService OData APIs', () => {

  it('serves AdminService.Authors', async () => {
    const { data } = await GET `/odata/v4/admin/Authors ${{ params: { $select: 'ID,name' } }}`
    expect(data.value).to.containSubset([
      // {"ID":14123379,"name":"name-14123379"},
    ])
  })

})
