{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros2-medkit-cmake,
  ros2-medkit-gateway,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2_medkit_linux_introspection";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."ros2_medkit_linux_introspection";
  nativeBuildInputs = [ ament-cmake ros2-medkit-cmake ];
  propagatedNativeBuildInputs = [ ros2-medkit-gateway ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libcpp-httplib-dev" "libssl-dev" "libsystemd-dev" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ros2-medkit-cmake ];
  propagatedBuildInputs = [ ros2-medkit-gateway ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libcpp-httplib-dev" "libssl-dev" "libsystemd-dev" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_medkit_linux_introspection" = substituteSource {
      src = fetchgit {
        name = "ros2_medkit_linux_introspection-source";
        url = "https://github.com/ros2-gbp/ros2_medkit-release.git";
        rev = "61cc9ed711e43dac1b68651a7171b4ed4ec75272";
        hash = "sha256-bjndV7pocopaCZoZuHA+4TCVilme2lAjy5wgE+x+/2s=";
      };
    };
  });
  meta = {
    description = "Linux introspection plugins for ros2_medkit gateway - procfs, systemd, and container";
  };
})
