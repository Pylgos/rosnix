{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cras_msgs";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."cras_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-environment rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cras_msgs" = substituteSource {
      src = fetchgit {
        name = "cras_msgs-source";
        url = "https://github.com/ros2-gbp/cras_msgs-release.git";
        rev = "240f7401e264c75e51737b35ac19d3c9b05de4a5";
        hash = "sha256-MLEi9xNAzta/BEGytkEuDzM+iFSYdPL76fGbJLklLHg=";
      };
    };
  });
  meta = {
    description = "Common messages used by CRAS";
  };
})
