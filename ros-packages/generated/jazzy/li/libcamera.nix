{
  buildMesonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildMesonPackage (finalAttrs: {
  pname = "libcamera";
  version = "0.7.1-1";
  src = finalAttrs.passthru.sources."libcamera";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" "meson" "pkg-config" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libatomic" "libssl-dev" "libudev-dev" "libyuv-dev" "openssl" "pybind11-dev" "python3" "python3-jinja2" "python3-ply" "python3-yaml" "yaml" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "git" "meson" "pkg-config" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libatomic" "libssl-dev" "libudev-dev" "libyuv-dev" "openssl" "pybind11-dev" "python3" "python3-jinja2" "python3-ply" "python3-yaml" "yaml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "libcamera" = substituteSource {
      src = fetchgit {
        name = "libcamera-source";
        url = "https://github.com/ros2-gbp/libcamera-release.git";
        rev = "df25535794ea224ca20a366fa288a3dcc55a6a45";
        hash = "sha256-LCuxsgh3qGwVgZPW5ehHIoceudMudXSXvq9v7YnCH6w=";
      };
    };
  });
  meta = {
    description = "An open source camera stack and framework for Linux, Android, and ChromeOS";
  };
})
