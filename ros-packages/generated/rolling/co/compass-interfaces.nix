{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  cras-cpp-common,
  cras-lint,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "compass_interfaces";
  version = "3.0.3-1";
  src = finalAttrs.passthru.sources."compass_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ cras-cpp-common rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ cras-cpp-common rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-gtest cras-lint ];
  passthru.sources = mkSourceSet (sources: {
    "compass_interfaces" = substituteSource {
      src = fetchgit {
        name = "compass_interfaces-source";
        url = "https://github.com/ros2-gbp/compass-release.git";
        rev = "d03de0bbc4553f41a52c1c7a9e46b482efcb8080";
        hash = "sha256-28iWGpmLzInogR+DPdmLA8EG0cI6powUQbQNKuC5DNk=";
      };
    };
  });
  meta = {
    description = "Messages related to compass";
  };
})
