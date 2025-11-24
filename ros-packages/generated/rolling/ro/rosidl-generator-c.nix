{
  ament-cmake,
  ament-cmake-core,
  ament-cmake-python,
  ament-cmake-ros-core,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcutils,
  rosSystemPackages,
  rosidl-cli,
  rosidl-cmake,
  rosidl-generator-type-description,
  rosidl-parser,
  rosidl-pycommon,
  rosidl-typesupport-interface,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_generator_c";
  version = "5.1.1-1";
  src = finalAttrs.passthru.sources."rosidl_generator_c";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ ament-cmake-core ament-index-python rcutils rosidl-cli rosidl-cmake rosidl-generator-type-description rosidl-parser rosidl-pycommon rosidl-typesupport-interface ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ament-cmake-ros-core ];
  propagatedBuildInputs = [ ament-cmake-core ament-index-python rcutils rosidl-cli rosidl-cmake rosidl-generator-type-description rosidl-parser rosidl-pycommon rosidl-typesupport-interface ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_generator_c" = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_c-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "c3201090db732cccfffe13edd769f82b05b9d34e";
        hash = "sha256-jTxmY2rqaYQcdoDDu5/tQ8bADckR3JVCS9QcmcVex/M=";
      };
    };
  });
  meta = {
    description = "Generate the ROS interfaces in C.";
  };
})
