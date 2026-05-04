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
  version = "1.1.2-2";
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
        rev = "14d2e433521662aa8704c48cb4ec70738572c08b";
        hash = "sha256-w1ab2z6JMJ1I0arhbBJnOZgyv6ek2qua0HznHUc6eEo=";
      };
    };
  });
  meta = {
    description = "CMake utility toolbox";
  };
})
