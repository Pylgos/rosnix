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
  version = "4.10.0-1";
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
        rev = "0fbad62d9eb774563c5c453271002d8ed5fbac9e";
        hash = "sha256-SAMzukYBe2GyP8+VFnKz8p3fqTxuZF6JQKc+3Xh3EMw=";
      };
    };
  });
  meta = {
    description = "Generate hashes and descriptions of ROS 2 interface types, per REP-2011.";
  };
})
