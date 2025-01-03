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
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."libcamera";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "meson" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" "python3-jinja2" "python3-yaml" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libatomic" "libssl-dev" "libudev-dev" "openssl" "pybind11-dev" "python3" "python3-ply" "yaml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "libcamera" = substituteSource {
      src = fetchgit {
        name = "libcamera-source";
        url = "https://github.com/ros2-gbp/libcamera-release.git";
        rev = "42faf17a65432f065451393302647f5818115ad9";
        hash = "sha256-+ZdefTtR4pOz+555iMeN+j8iUGYfCPezJPTPmFZpoQY=";
      };
    };
  });
  meta = {
    description = "An open source camera stack and framework for Linux, Android, and ChromeOS";
  };
})
