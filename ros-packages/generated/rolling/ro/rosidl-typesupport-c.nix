{
  ament-cmake-core,
  ament-cmake-ros,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mimick-vendor,
  mkSourceSet,
  performance-test-fixture,
  rcpputils,
  rcutils,
  rosSystemPackages,
  rosidl-cli,
  rosidl-generator-c,
  rosidl-pycommon,
  rosidl-runtime-c,
  rosidl-typesupport-fastrtps-c,
  rosidl-typesupport-interface,
  rosidl-typesupport-introspection-c,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_typesupport_c";
  version = "3.3.2-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_c";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake-core rosidl-cli rosidl-generator-c rosidl-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  propagatedBuildInputs = [ ament-index-python rcpputils rcutils rosidl-runtime-c rosidl-typesupport-fastrtps-c rosidl-typesupport-interface rosidl-typesupport-introspection-c ];
  checkInputs = [ ament-lint-auto ament-lint-common mimick-vendor performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_typesupport_c" = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_c-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport-release.git";
        rev = "4c7ccb7566f5d4d5beb55c4386bc5b27e26ff41b";
        hash = "sha256-HQ8/GhDehwe1GscbDZz1vr7uwr+n+HtSH3HLE740d/Y=";
      };
    };
  });
  meta = {
    description = "Generate the type support for C messages.";
  };
})
