{
  ament-cmake-core,
  ament-cmake-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_test";
  version = "2.7.2-1";
  src = finalAttrs.passthru.sources."ament_cmake_test";
  nativeBuildInputs = [ ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  buildInputs = [ ament-cmake-python ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_test" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_test-source";
          url = "https://github.com/ros2-gbp/ament_cmake-release.git";
          rev = "51621cfc85a44f24bd170a11d376c752dbaed4c7";
          hash = "sha256-AbMzybwoTEc56QIhCWbNsxBX+IWNNEJBiFJkaWUL+nQ=";
        };
      };
    });
  };
  meta = {
    description = "The ability to add tests in the ament buildsystem in CMake.";
  };
})
