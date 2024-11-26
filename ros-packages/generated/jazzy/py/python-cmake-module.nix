{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "python_cmake_module";
  version = "0.11.1-2";
  src = finalAttrs.passthru.sources."python_cmake_module";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "python_cmake_module" = substituteSource {
        src = fetchgit {
          name = "python_cmake_module-source";
          url = "https://github.com/ros2-gbp/python_cmake_module-release.git";
          rev = "52f6dbc990f7a89ceb09ab0cc394cc7214138f62";
          hash = "sha256-Klye1NN6+5ap5R+UqUk2oAwG5lScU4OPpYX+nALlnno=";
        };
      };
    });
  };
  meta = {
    description = "Provide CMake module with extra functionality for Python.";
  };
})
