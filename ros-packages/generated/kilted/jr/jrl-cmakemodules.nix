{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "jrl_cmakemodules";
  version = "1.1.2-1";
  src = finalAttrs.passthru.sources."jrl_cmakemodules";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" "pkg-config" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "doxygen" "pkg-config" ]; };
  passthru.sources = mkSourceSet (sources: {
    "jrl_cmakemodules" = substituteSource {
      src = fetchgit {
        name = "jrl_cmakemodules-source";
        url = "https://github.com/ros2-gbp/jrl_cmakemodules-release.git";
        rev = "5c5801fc0304b0116fe8e4e4701429b82ee89a51";
        hash = "sha256-w1ab2z6JMJ1I0arhbBJnOZgyv6ek2qua0HznHUc6eEo=";
      };
    };
  });
  meta = {
    description = "CMake utility toolbox";
  };
})
