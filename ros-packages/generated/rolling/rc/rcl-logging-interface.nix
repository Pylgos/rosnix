{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcpputils,
  rcutils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcl_logging_interface";
  version = "3.5.0-1";
  src = finalAttrs.passthru.sources."rcl_logging_interface";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rcutils ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rcutils ];
  checkInputs = [ ament-lint-auto ament-lint-common rcpputils ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_logging_interface" = substituteSource {
      src = fetchgit {
        name = "rcl_logging_interface-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "c4c6f0213213bd04bb2fc4b30cc17cda9acf7dd5";
        hash = "sha256-J5M3lu3wzDE6qjD1fFjhJuMbFuLzQ52X0s4h9+cyGmo=";
      };
    };
  });
  meta = {
    description = "Interface that rcl_logging backends needs to implement.";
  };
})
