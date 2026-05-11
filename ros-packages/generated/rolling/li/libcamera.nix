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
  version = "0.7.1-2";
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
        rev = "404ee7514e0eb6cd25712a709f447fe78c190631";
        hash = "sha256-LCuxsgh3qGwVgZPW5ehHIoceudMudXSXvq9v7YnCH6w=";
      };
    };
  });
  meta = {
    description = "An open source camera stack and framework for Linux, Android, and ChromeOS";
  };
})
