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
  version = "4.10.0-1";
  src = finalAttrs.passthru.sources."rosidl_generator_c";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ ament-cmake-core rosidl-cli rosidl-cmake rosidl-generator-type-description rosidl-parser rosidl-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ament-cmake-ros-core ];
  propagatedBuildInputs = [ ament-cmake-core rosidl-cli rosidl-cmake rosidl-generator-type-description rosidl-parser rosidl-pycommon ];
  depsTargetTargetPropagated = [ ament-index-python rcutils rosidl-typesupport-interface ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_generator_c" = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_c-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "a485980a4a28033eab7f65000c5134fe2120b2f9";
        hash = "sha256-+ZsL3VKVYY4IOzCpkFiXYaDfqa3LlrlqUp5FilMhkMM=";
      };
    };
  });
  meta = {
    description = "Generate the ROS interfaces in C.";
  };
})
