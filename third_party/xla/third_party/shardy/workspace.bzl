"""Provides the repository macro to import Shardy."""

load("//third_party:repo.bzl", "tf_http_archive", "tf_mirror_urls")

def repo():
    SHARDY_COMMIT = "fc7d8f0eb75b091e24c5b5b70ebd83ae60acc77c"
    SHARDY_SHA256 = "0c03300c42a24e2c7d61ded86fb7e4ba982425b1ad55610f1a5d062a79527372"

    tf_http_archive(
        name = "shardy",
        sha256 = SHARDY_SHA256,
        strip_prefix = "shardy-{commit}".format(commit = SHARDY_COMMIT),
        urls = tf_mirror_urls("https://github.com/openxla/shardy/archive/{commit}.zip".format(commit = SHARDY_COMMIT)),
        patch_file = ["//third_party/shardy:temporary.patch"],
    )
