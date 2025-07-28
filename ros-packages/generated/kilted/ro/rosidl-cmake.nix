{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-pycommon,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_cmake";
  version = "4.9.5-1";
  src = finalAttrs.passthru.sources."rosidl_cmake";
  nativeBuildInputs = [ ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-cmake rosidl-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-empy" ]; };
  buildInputs = [ ament-cmake-python ];
  propagatedBuildInputs = [ ament-cmake rosidl-pycommon ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-empy" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_cmake" = substituteSource {
      src = fetchgit {
        name = "rosidl_cmake-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "23007d1a29e6f944fb5587ba3e161434ea2d6d9c";
        hash = "sha256-y5R2oBIN5eN77MLKipkgyWqTg/tD41GxtUmnhIehIRI=";
      };
    };
  });
  meta = {
    description = "The CMake functionality to invoke code generation for ROS interface files.";
  };
})
