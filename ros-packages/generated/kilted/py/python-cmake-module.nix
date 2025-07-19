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
  version = "0.12.0-2";
  src = finalAttrs.passthru.sources."python_cmake_module";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "python_cmake_module" = substituteSource {
      src = fetchgit {
        name = "python_cmake_module-source";
        url = "https://github.com/ros2-gbp/python_cmake_module-release.git";
        rev = "0d3e994793d5eff816de03fa2f7a16a1fd8ffba2";
        hash = "sha256-hGj3MhMdxu3gXrz77GuQ4xIf4eBEv4/MR1NsXvZXEMU=";
      };
    };
  });
  meta = {
    description = "Provide CMake module with extra functionality for Python.";
  };
})
