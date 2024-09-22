{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    uncrustify_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "uncrustify_vendor-source";
        owner = "ros2-gbp";
        repo = "uncrustify_vendor-release";
        rev = "69a8304c634ed4b0872634acbc73bc1854510fff";
        hash = "sha256-yVmdBegpkwKPCWppTjfeJpLZn9LCFAPVsI0sy2mZvpw=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/uncrustify/uncrustify.git";
          to = "VCS_TYPE path VCS_URL ${uncrustify_vendor-vendor_source-uncrustify-0}";
        }
      ];
    };
    uncrustify_vendor-vendor_source-uncrustify-0 = substituteSource {
      src = fetchFromGitHub {
        name = "uncrustify_vendor-vendor_source-uncrustify-0-source";
        owner = "uncrustify";
        repo = "uncrustify";
        rev = "b8c95286f70ef8e0e83bd055a3a7aabb614a0781";
        hash = "sha256-L+YEVZC7sIDYuCM3xpSfZLjA3B8XsW5hi+zV2NEgXTs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "uncrustify_vendor";
  version = "3.0.0-2";
  src = sources.uncrustify_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "uncrustify" ]; };
  buildInputs = [ ament_cmake ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "uncrustify" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Wrapper around uncrustify, providing nothing but a dependency on uncrustify, on some systems. On others, it provides an ExternalProject build of uncrustify.";
  };
}
