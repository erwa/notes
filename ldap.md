### Paginated results using Java API

```
  private Set<String> fetchAllHeadlessUsers() {
    Set<String> headlessUsers = new HashSet<>();

    Hashtable env = new Hashtable();
    env.put(Context.INITIAL_CONTEXT_FACTORY, CONTEXT_FACTORY);
    env.put(Context.PROVIDER_URL, HADOOP_PROVIDER_URL);

    LdapContext ctx = null;
    try {
      ctx = new InitialLdapContext(env, null);

      // Activate paged results
      ctx.setRequestControls(new Control[] { new PagedResultsControl(PAGE_SIZE, Control.CRITICAL) });
      SearchControls ctls = new SearchControls();
      ctls.setReturningAttributes(new String[] {CN_ATTR});
      ctls.setSearchScope(SearchControls.SUBTREE_SCOPE);

      byte[] cookie = null;

      do {
        // Get batch of headless users
        NamingEnumeration<SearchResult> results = ctx.search(HEADLESS_USERS_DN, CN_FILTER, ctls);

        // Add non-ignored headless users
        while (results != null && results.hasMore()) {
          SearchResult result = results.next();
          Attribute cn = result.getAttributes().get(CN_ATTR);
          if (cn != null) {
            String user = cn.get().toString();
            if (!isIgnoredUser(user)) {
              headlessUsers.add(user);
            }
          }
        }

        // Extract cookie from results control response
        Control[] controls = ctx.getResponseControls();
        if (controls != null) {
          for (int i = 0; i < controls.length; i++) {
            if (controls[i] instanceof PagedResultsResponseControl) {
              PagedResultsResponseControl prrc = (PagedResultsResponseControl) controls[i];
              cookie = prrc.getCookie();
            }
          }
        } else {
          LOG.warn("No controls were sent from the server!");
        }

        // Prepare to fetch next batch
        ctx.setRequestControls(new Control[] { new PagedResultsControl(PAGE_SIZE, cookie, Control.CRITICAL) });
      } while (cookie != null);

      System.out.println("Number of headless results: " + headlessUsers.size());

    } catch (NamingException | IOException e) {
      LOG.error("Encountered exception while fetching headless users", e);
    } finally {
      if (ctx != null) {
        try {
          ctx.close();
        } catch (NamingException e) {
          LOG.error("Encountered exception while closing context", e);
        }
      }
    }
    return headlessUsers;
  }
```

https://stackoverflow.com/questions/11311765/ldap-how-to-return-more-than-1000-results-java


### AND or OR filters together

```
(&(objectClass=person)(objectClass=user))
(|(objectClass=person)(objectClass=user))
```

https://confluence.atlassian.com/kb/how-to-write-ldap-search-filters-792496933.html


### Examples

```
# search for user
ldapsearch -LLLx "uid=myuser"

# search for netgroup
ldapsearch -LLLx -b ou=netgroups,dc=foo,dc=example,dc=com "cn=my_netgroup"
```

https://ilostmynotes.blogspot.com/2011/09/ldap-search-queries.html


### ldapsearch

```
-x  # use simple authentication
-L  # number of Ls controls how much output. In general, more Ls means less output.
-b  # specifies a starting point for the search
```


### General

LDAP is hierarchical. Order of "OU" (organizational unit) in search matters.