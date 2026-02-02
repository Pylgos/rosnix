{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl-logging-interface,
  rcl-logging-noop,
  rcl-logging-spdlog,
  rcpputils,
  rcutils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcl_logging_implementation";
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."rcl_logging_implementation";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rcl-logging-interface rcl-logging-spdlog rcpputils rcutils ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rcl-logging-interface rcl-logging-spdlog rcpputils rcutils ];
  checkInputs = [ ament-lint-auto ament-lint-common rcl-logging-noop ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_logging_implementation" = substituteSource {
      src = fetchgit {
        name = "rcl_logging_implementation-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "99c131c9c77a172620052a1efcf50167413f5d5d";
        hash = "sha256-8q7yA6TLANFyd4DjtPpnhmXB4z+pH0bsEGpKupmBLns=";
      };
    };
  });
  meta = {
    description = "\n    Provides the ability to load logging implementations at runtime.\n    This package acts as an abstraction layer between rcl and the actual\n    logging implementation (e.g., spdlog, noop, or custom implementations).\n  ";
  };
})
