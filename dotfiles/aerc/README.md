# aerc

## accounts.conf

- the accounts configuration is straight-forward, generated with `:new-account` inside `aerc`

- I use oauth for my college gmail account (which is a major pain). the account entry for that account looks like this (where `{ }` are placeholders):

```
[{email}]
source = imaps+oauthbearer://{email}:{refresh token}@imap.gmail.com:993?\
client_id={id}&\
client_secret={secret}&\
token_endpoint=https%3A%2F%2Faccounts.google.com%2Fo%2Foauth2%2Ftoken
outgoing = smtps+oauthbearer://{email}:{refresh token}@smtp.gmail.com:465?\
client_id={id}&\
client_secret={secret}&\
token_endpoint=https%3A%2F%2Faccounts.google.com%2Fo%2Foauth2%2Ftoken
from = {name} <{email}>
cache-headers = true
```

### generating the refresh token

#### in google cloud

- in [google cloud](https://console.cloud.google.com), make a new project, and enable the [gmail api](https://console.cloud.google.com/marketplace/product/google/gmail.googleapis.com)

- go to the [api dashboard](https://console.cloud.google.com/apis/dashboard), and make a new `OAuth Client ID` in the `Credentials` tab (or there might already be a prompt to do this)

- fill out the first time configuration, and for `scopes`, select all the gmail scopes

- choose `Web Application` as the application type, and add `https://oauth2.dance/` as a redirect uri

#### in cli

- using [google's oauth2 token script](https://github.com/google/gmail-oauth2-tools/blob/master/python/oauth2.py), generate the refresh token with the following command:

```
python oauth2.py --user={email} \
	--client_id={id} \
	--client_secret={secret} \
	--generate_oauth2_token
```

### adding escape sequences

- finally, replace the `@` in the `{email}` in `source = ` with `%40`

- and, replace any `/`'s in the refresh token with `%2F`

### documentation

- I couldn't have gotten any of this working witout the following resources

- [initial commit message](https://git.sr.ht/~sircmpwn/aerc/commit/b0eaf5191c9bc5b128e347625b7eef998ba63c41)

- [some very terse documentation from a personal blog](https://www.dennisc.net/writing/tech/gmail-aerc)

- and most importantly, [an email chain](https://lists.sr.ht/~rjarry/aerc-discuss/%3CCJO2XVDY70X2.1AUYN8NQALM09@ArchPC%3E)

<details>
  <summary>the last email from that chain</summary>
hello, all!

i don't mean to beat a dead horse, but i managed to get oauth2 working!!
it really worked all along, but the process on how to do so was never
clearly described.

i was successful thanks to areotwister outlining his initial attempt.

Areotwister wrote:

> It would be rly great if a little help could be provided on how to get
> OAuth2 running for Gmail, as Gmail is going to stop supporting access
> for authentification over only username and password at May 30 this
> year 2022.

agreed. and i was in a similar boat with this account, and out of
stubbornness i did not want to enable 2fa in order to create an app
specific password. changes like these really increase one's dependence
on outside factors / other devices, and this isn't a good thing imho.
i've gone through creating an app specific password for my other gmail
accounts and admittedly doing so is much easier than setting aerc up
with oauthbearer, but i digress.

> - The manpage for aerc-imap ...

the man page would much benefit from elaborating on this! i'd be
willing to submit a patch improving the documentation on this matter
when i find the time.

> - and the following commit message [0]

pointing to that commit message is really what helped me figure this
out.

> ... follow the route described in the commit message

this is the way.

> ... the Python > script at [1] isn't up-to-date and is still written
> in Python Version 2.

we would all benefit if the script were updated to python3, but you have
to understand this isn't a priority for a company which revenues $182.5B
such a script may already exist that we overlooked. at my prior job
(not at google) i had to port some of the old python2 google api stuff
to python3.

however, it still works if one is willing to install a much deprecated
python2.

> And that's here now, where i'm stuck. I can't even tell if the hints
> in the commit message are only implementation related and if that's
> stuff i don't have to bother anymore (create the acess token etc.)

yes, the refresh token is needed and should go in what is typically the
password field in accounts.conf
also, remember that those fields need to be url encoded. my refresh
token had two forward slashes in it that i converted manually.

i know most of us that still use gmail have likely already moved on to
app specific passwords, but i'm not a big fan of forced change like this
and am super excited that aerc can work to authenticate this way with
oauthbearer.

[0]: https://lists.sr.ht/~sircmpwn/aerc/%3C20190710190026.57318-1-frode.aa%40gmail.com%3E
[1]: https://github.com/google/gmail-oauth2-tools/blob/master/python/oauth2.py

best,
akspecs

sent via aerc with an smtps+oauthbearer configuration

</details>
