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
  version = "3.0.2-1";
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
        rev = "348ca63c8e32e91c5feffdfb0097835b813fb85f";
        hash = "sha256-+Gs2hl+djfzDFeihnq6Pup0NphenYscOWMDwOz0ZfI8=";
      };
    };
  });
  meta = {
    description = "Messages related to compass";
  };
})
