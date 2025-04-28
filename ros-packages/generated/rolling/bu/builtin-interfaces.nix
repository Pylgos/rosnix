{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-core-generators,
  rosidl-core-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "builtin_interfaces";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."builtin_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-core-generators ];
  propagatedBuildInputs = [ rosidl-core-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "builtin_interfaces" = substituteSource {
      src = fetchgit {
        name = "builtin_interfaces-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "a4cccdb8cacc56d8b95297a351913c52c3ce9945";
        hash = "sha256-gPD1UzII+LAiIwZwMwLP7GUSAUSOCHo9Zk4xbDu1Xpk=";
      };
    };
  });
  meta = {
    description = "A package containing message and service definitions for types defined in the OMG IDL Platform Specific Model.";
  };
})
