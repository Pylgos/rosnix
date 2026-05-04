{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "std_srvs";
  version = "5.9.2-2";
  src = finalAttrs.passthru.sources."std_srvs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "std_srvs" = substituteSource {
      src = fetchgit {
        name = "std_srvs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "41caed279729455c9c33dc78e3207c90a95ebb73";
        hash = "sha256-o/7k3F1G7n2LxA1Pce3yfMaIAEmKBF8F02/kWzchnks=";
      };
    };
  });
  meta = {
    description = "A package containing some standard service definitions.";
  };
})
