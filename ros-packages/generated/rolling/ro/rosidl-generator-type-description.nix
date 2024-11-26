{
  ament-cmake-core,
  ament-cmake-python,
  ament-cmake-ros,
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
  version = "4.9.2-1";
  src = finalAttrs.passthru.sources."rosidl_generator_type_description";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake-core rosidl-cli rosidl-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  buildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedBuildInputs = [ ament-cmake-core rosidl-cli rosidl-parser ];
  depsTargetTargetPropagated = [ ament-index-python ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_generator_type_description" = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_type_description-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "a2fb635ceab416334beb3b1575c5b4030f12c44a";
        hash = "sha256-WmYga2jNNX263Q+CB7o7kt2QcETJPGYPk8UrRvwwel8=";
      };
    };
  });
  meta = {
    description = "Generate hashes and descriptions of ROS 2 interface types, per REP-2011.";
  };
})
