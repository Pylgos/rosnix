{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mola-yaml,
  mrpt-libgui,
  mrpt-libmaps,
  mrpt-libobs,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_kernel";
  version = "1.9.0-1";
  src = finalAttrs.passthru.sources."mola_kernel";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-common mola-yaml mrpt-libgui mrpt-libmaps mrpt-libobs ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-yaml mrpt-libgui mrpt-libmaps mrpt-libobs ];
  passthru.sources = mkSourceSet (sources: {
    "mola_kernel" = substituteSource {
      src = fetchgit {
        name = "mola_kernel-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "6a96538d3928e702c8546a5179eb286e93424b79";
        hash = "sha256-hcV2ClbF1yv0BdVmqxL2XKpOhTa/G3KvgoKai+wEe5o=";
      };
    };
  });
  meta = {
    description = "Fundamental C++ virtual interfaces and data types for the rest of MOLA modules";
  };
})
