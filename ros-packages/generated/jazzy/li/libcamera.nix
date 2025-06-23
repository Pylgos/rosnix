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
  version = "0.5.1-1";
  src = finalAttrs.passthru.sources."libcamera";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" "meson" "pkg-config" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libatomic" "libssl-dev" "libudev-dev" "openssl" "pybind11-dev" "python3" "python3-jinja2" "python3-ply" "python3-yaml" "yaml" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "git" "meson" "pkg-config" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libatomic" "libssl-dev" "libudev-dev" "openssl" "pybind11-dev" "python3" "python3-jinja2" "python3-ply" "python3-yaml" "yaml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "libcamera" = substituteSource {
      src = fetchgit {
        name = "libcamera-source";
        url = "https://github.com/ros2-gbp/libcamera-release.git";
        rev = "26d408907546e61cbcf2d0ff2e99cd6378148ae7";
        hash = "sha256-A/5B9sl0RhKma0DzU9Ruw9cpt9pBDAuvBdqAVrfz/bY=";
      };
    };
  });
  meta = {
    description = "An open source camera stack and framework for Linux, Android, and ChromeOS";
  };
})
