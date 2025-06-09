{
  ament-cmake-core,
  ament-cmake-gtest,
  ament-package,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_gen_version_h";
  version = "2.8.2-1";
  src = finalAttrs.passthru.sources."ament_cmake_gen_version_h";
  nativeBuildInputs = [ ament-package ];
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  buildInputs = [ ament-package ];
  propagatedBuildInputs = [ ament-cmake-core ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_gen_version_h" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_gen_version_h-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "f2963cb61dbe1855f0a99f94b73c021d8c095bae";
        hash = "sha256-xy1svS1WOp1KKzUWWSoXMZ1VKfzODRqMzVBlyQogfSM=";
      };
    };
  });
  meta = {
    description = "Generate a C header containing the version number of the package";
  };
})
