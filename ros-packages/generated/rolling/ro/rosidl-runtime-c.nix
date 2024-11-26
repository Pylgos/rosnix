{
  ament-cmake,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  performance-test-fixture,
  rcutils,
  rosSystemPackages,
  rosidl-typesupport-interface,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_runtime_c";
  version = "4.9.2-1";
  src = finalAttrs.passthru.sources."rosidl_runtime_c";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rcutils rosidl-typesupport-interface ];
  checkInputs = [ ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_runtime_c" = substituteSource {
      src = fetchgit {
        name = "rosidl_runtime_c-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "4dee07e7b214e1fb084e88a9ae98cc9ecbcbc2fd";
        hash = "sha256-9iurd/W1LLqvrP3jzPpAsNh51gKk+q+FJwjOPGSorGY=";
      };
    };
  });
  meta = {
    description = "Provides definitions, initialization and finalization functions, and macros for getting and working with rosidl typesupport types in C.";
  };
})
