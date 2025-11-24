{
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
  rosSystemPackages,
  rosidl-cli,
  rosidl-parser,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_generator_type_description";
  version = "5.1.1-1";
  src = finalAttrs.passthru.sources."rosidl_generator_type_description";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ ament-cmake-core ament-index-python rosidl-cli rosidl-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  buildInputs = [ ament-cmake-python ament-cmake-ros-core ];
  propagatedBuildInputs = [ ament-cmake-core ament-index-python rosidl-cli rosidl-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_generator_type_description" = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_type_description-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "6a74e14cb0da06f6369616e4e44e416283330dbc";
        hash = "sha256-bQsp4ohBsj7KfFB59TJLn+u+Md15+lKlCkYfbZbSGMM=";
      };
    };
  });
  meta = {
    description = "Generate hashes and descriptions of ROS 2 interface types, per REP-2011.";
  };
})
